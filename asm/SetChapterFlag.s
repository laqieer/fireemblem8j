	.syntax unified
	.section .text.SetChapterFlag, "ax", %progbits
@ SetChapterFlag @ JP 0x08085F00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetChapterFlag
	.thumb_func
SetChapterFlag:
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	beq _08085F28
	subs r3, #1
	ldr r1, _08085F2C @ =0x03005260
	adds r0, r3, #0
	cmp r3, #0
	bge _08085F14
	adds r0, r3, #7
_08085F14:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _08085F30 @ =0x08A5A6A0
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	strb r1, [r2]
_08085F28:
	pop {r0}
	bx r0
	.align 2, 0
_08085F2C: .4byte 0x03005260
_08085F30: .4byte 0x08A5A6A0

