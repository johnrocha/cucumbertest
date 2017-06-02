module ServiceHelpers
  def testmoip
    @testmoip ||= Service::TestMoip.new
  end
end
