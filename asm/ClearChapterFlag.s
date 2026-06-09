	.syntax unified
	.section .text.ClearChapterFlag, "ax", %progbits
@ ClearChapterFlag @ JP 0x08085F34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClearChapterFlag
	.thumb_func
ClearChapterFlag:
	push {lr}
	adds r2, r0, #0
	cmp r2, #0
	beq _08085F62
	subs r2, #1
	ldr r3, _08085F68 @ =0x08A5A6A0
	adds r1, r2, #0
	cmp r2, #0
	bge _08085F48
	adds r1, r2, #7
_08085F48:
	asrs r1, r1, #3
	lsls r0, r1, #3
	subs r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _08085F6C @ =0x03005260
	adds r1, r1, r0
	ldrb r0, [r1]
	ands r0, r3
	strb r0, [r1]
_08085F62:
	pop {r0}
	bx r0
	.align 2, 0
_08085F68: .4byte 0x08A5A6A0
_08085F6C: .4byte 0x03005260

