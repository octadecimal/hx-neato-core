package;

import haxe.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

/**
 * ...
 * @author Dylan Heyes
 */
class TempTest 
{
	private var timer:Timer;
	
	public function new() 
	{
		
	}
	
	@BeforeClass
	public function beforeClass():Void
	{
		// This will run once per test class
	}
	
	@AfterClass
	public function afterClass():Void
	{
		// This will run once per test class
	}
	
	@Before
	public function setup():Void
	{
		// This will run before every test
	}
	
	@After
	public function tearDown():Void
	{
		// This will run after every test
	}
	
	
	@Test
	public function testExample():Void
	{
		Assert.isTrue(true);
	}
}