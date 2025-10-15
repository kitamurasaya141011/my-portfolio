document.addEventListener('turbo:load', function() {
  const roleSelect = document.getElementById('role-select');
  
  // 固有情報フィールドのDOM要素を取得
  const studentFields = document.getElementById('student-fields');
  const teacherFields = document.getElementById('teacher-fields');
  // ... 他のフィールドも同様に取得

  // 役割名とフィールドIDのマッピング（サーバーサイドのデータが必要）
  // サーバーサイドから role_id と name の対応を渡す必要があります
  // 例として、ロール名で判断する簡単な関数を定義します
  // 実際には、コントローラーから data 属性などで ID を渡すのが理想的です
  
  // 仮の対応表 (seeds.rb の '学生' や '教員' のIDを想定)
  const ROLE_MAP = {
    '学生': studentFields,
    '教員': teacherFields
    // '事務局': adminFields // 管理者は画面から作らないため不要
  };

  function toggleFields() {
    // まずすべての固有フィールドを非表示にする
    Object.values(ROLE_MAP).forEach(field => {
      if (field) field.style.display = 'none';
    });

    const selectedRoleName = roleSelect.options[roleSelect.selectedIndex].text;
    const targetField = ROLE_MAP[selectedRoleName];

    // 選択された役割に対応するフィールドを表示する
    if (targetField) {
      targetField.style.display = 'block';
    }
  }

  // ページロード時とドロップダウン変更時に実行
  if (roleSelect) {
    roleSelect.addEventListener('change', toggleFields);
    // 初期状態を適用
    toggleFields(); 
  }
});
