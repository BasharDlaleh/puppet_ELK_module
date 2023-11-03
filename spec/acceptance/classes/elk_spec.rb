# here we rewuire the helper file we created
require 'spec_helper_acceptance'

# below is just a human readable name tag for what we're testing
describe 'elk class' do
  # this is also a human readable name for the context
  context 'default parameters' do
    # this is like defining a variable, the manifest is what the Puppet command will actually apply on this system
    let(:manifest){
      "class {'elk':}"
    }
    # this is also a human readable name for what this test is doing
    it 'should run without errors' do
      # here's the actual meat of the test
      result = apply_manifest(manifest, :catch_failures => true)
      # when Puppet runs and changes are made, it will return an exit code of two. If it runs with no changes it returns an exit code of zero so we want the code to be 2 not 0
      expect(result.exit_code).to eq 2
    end
  end
end

