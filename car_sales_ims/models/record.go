package models

type Record struct {
	RecordID string `json:"id"`
	Time     Time   `json:"time"`
	Type     string `json:"type"`
	Content  string `json:"content" gorm:"type:text"`
}
