package core 
{
	import com.yusuf.guitarpluss.interfaces.ICore;
	import feathers.controls.ScreenNavigatorItem;
	import starling.display.Stage;
	import starling.display.Sprite;
	import starling.events.Event;
	import feathers.controls.ScreenNavigator;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	import feathers.motion.transitions.OldFadeNewSlideTransitionManager;
	
	public class StateManager 
	{
		public  const DUMMY_STATE:uint = 0;
		private var coreInterface:ICore;
		private var parentThis:Game;
		private var stage:Stage;
		
		private var screenNavigators:ScreenNavigator = new ScreenNavigator();
		private var dummyState:MainStates;
		public function StateManager(parentThis:Game,stage:Stage) 
		{
			this.stage = stage;
			this.parentThis = parentThis;
			
			//create state
			dummyState = new MainStates(this);
			
			//register screen
			screenNavigators.addScreen("DUMMY NAME",new ScreenNavigatorItem(dummyState));
			
			//addScreenManager
			parentThis.addChild(screenNavigators);
			
			//add Animation
			var tm:OldFadeNewSlideTransitionManager = new OldFadeNewSlideTransitionManager(screenNavigators);
			
			//changeState
			ChangeState(MAIN_STATE);
		}
		public function ChangeState(state:uint):void
		{
			
			if (coreInterface != null)
			{
				coreInterface.Destroy();
				coreInterface = null;
			}
			
			switch (state) 
			{
				case DUMMY_STATE:
					coreInterface = dummyState;
					screenNavigators.showScreen("MAIN STATE")
				break;
			}
			if (coreInterface != null)
			{
				coreInterface.Init(stage);
			}
		}
		
	}

}