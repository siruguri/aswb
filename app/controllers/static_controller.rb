class StaticController < ApplicationController
  def edit
    @entries = [
      {
        label: 'Name',
        type: 'String',
        value: 'Los Angeles Jursidction'
      }, {
        label: 'Street Address',
        type: 'String',
        value: '1234 Fake Street'
      }, {
        label: 'City',
        type: 'String',
        value: 'Los Angeles'
      }, {
        label: 'Zip',
        type: 'String',
        value: '91311'
      }
    ]
  end
end
