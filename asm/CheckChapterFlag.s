	.syntax unified
	.section .text.CheckChapterFlag, "ax", %progbits
@ CheckChapterFlag @ JP 0x08085F88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CheckChapterFlag
	.thumb_func
CheckChapterFlag:
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	beq _08085FB2
	subs r3, #1
	ldr r1, _08085FB8 @ =0x03005260
	adds r0, r3, #0
	cmp r3, #0
	bge _08085F9C
	adds r0, r3, #7
_08085F9C:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _08085FBC @ =0x08A5A6A0
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _08085FC0
_08085FB2:
	movs r0, #0
	b _08085FC2
	.align 2, 0
_08085FB8: .4byte 0x03005260
_08085FBC: .4byte 0x08A5A6A0
_08085FC0:
	movs r0, #1
_08085FC2:
	pop {r1}
	bx r1
	.align 2, 0

