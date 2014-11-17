* Add Role to User

# Jurisdiction

* has_many :metadata_attribute_references
* has_many :metadata_values, through: :metadata_attribute_references

name, address, exempted_groups, ce_requirements_info{:text}, definitions[{:practice, :text}]
has_many :licensed_practices
has_many: :license_requirements, through: :licensed_practices

LicensedPractices
education, experience_numeric, education_experiences{:amount, :unit, :info}, supervised_experiences{:amount, :unit, :type, :info, :frequency, :total, :supervisor}, exam_required, board_approval (Boolean), renewal_period_in_years, ce_in_hours (-1=required, no spec hours), special_ce_requirements, provision_or_temp (Boolean), inactive_or_retired[Yes, No, Inactive], application_fee (float), fees{:currency, :certification, :renewal, :other_info}, renewal_schedule_in_years, 

# PracticeInfo

title, initial
has_many :licensed_practices
has_many :jurisdictions, through: :licensed_practices

# Change

changed_val, changed_by, changed_key, change_type (jurisdiction info OR license info)
belongs_to :jurisdiction

# DescribedModel

* name = Jurisdiction or LicenseType
* has_many :metadata_attributes

# MetadataAttribute

* belongs_to :described_model, class_name = DescribedModel
* Display Value
* Key
* Type (string) which has one of these values: boolean, integer, year, serialized array (multiple choice), text

# MetadataValue

* belongs_to metadata_attribute
* belongs_to attached_instance, polymorphic: true (type = one of the types listed in the names in ModelType)

Example - 
* License Type - education requirement - display value = 'education requirement' - assigned to instance of LicenseType
* key = :education_requirement
* type = 'enumerated'
* serialized_array = enumerated_values = 'High School Diploma', 'Associate/Diploma (2 year degree)', etc.

* CRUD a metadata attribute to a model - /metadata_attribute/new (belongs_to :described_model)
  * Assign a type
  * If it's enumerated, ask to select from a list of enumerated values (metadata_attributes[choices][0]=x, metadata_attributes[choices][1]=y, metadata_attributes[choices][2] = z, etc.)

* Assign a value to a model instance's metadata attribute - /jurisdiction/32/metadata_attributes/new
  * gather metadata attributes for the model
  * build association for instance's metadata_values - duplicate behavior of scaffolding based on each metadata_value's metadata_attribute's type - if it's integer, tag with note that causes JS validation; if it's multiple choice, generate a select; if it's boolean, a Yes/No radio; if it's year, a year dropdown; if it's text, then a text box
