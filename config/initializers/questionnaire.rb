ATTRIBUTE = { "TextAnswer" => "free_text", "HiddenAnswer" => "free_text", "TextBlockAnswer" => "text_block" , "NumberAnswer" => "number", "YearAnswer" => "year", "DateAnswer" => "date", "SingleAnswer" => "option_id", "MultipleAnswer" => "option_ids", "BooleanAnswer" => "option_id" }

QUESTION_TYPES = ['TextQuestion', 'TextBlockQuestion', 'NumberQuestion','DateQuestion', 'YearQuestion', 'SingleAnswerQuestion', 'MultipleAnswerQuestion', 'BooleanQuestion']

QUESTION_ANSWER_CONVERTER = { "TextQuestion" => "TextAnswer", "HiddenQuestion" => "HiddenAnswer", "TextBlockQuestion" => "TextBlockAnswer" , "NumberQuestion" => "NumberAnswer", "YearQuestion" => "YearAnswer", "DateQuestion" => "DateAnswer", "SingleAnswerQuestion" => "SingleAnswer", "MultipleAnswerQuestion" => "MultipleAnswer", "BooleanQuestion" => "BooleanAnswer" }

SINGLE_MULTIPLE_OTHER_MAP = {'SingleAnswerQuestion' => 'single_others', 'MultipleAnswerQuestion' => 'multiple_others'}

SINGLE_QUEST_VIEW_TYPE = ['Radio Buttons', 'Drop Down']

MULTIPLE_QUEST_VIEW_TYPE = ['Check Boxes', 'Multiple Select']

VERIFICATION_METHOD = {"Email" => "/^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/"}