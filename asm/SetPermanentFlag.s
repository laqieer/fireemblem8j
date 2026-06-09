	.syntax unified
	.section .text.SetPermanentFlag, "ax", %progbits
@ SetPermanentFlag @ JP 0x08085FC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetPermanentFlag
	.thumb_func
SetPermanentFlag:
	push {lr}
	adds r3, r0, #0
	cmp r3, #0x63
	ble _08085FF4
	cmp r3, #0x64
	beq _08085FF4
	subs r3, #0x65
	ldr r1, _08085FF8 @ =0x03005240
	adds r0, r3, #0
	cmp r3, #0
	bge _08085FE0
	adds r0, r3, #7
_08085FE0:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _08085FFC @ =0x08A5A6A0
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	strb r1, [r2]
_08085FF4:
	pop {r0}
	bx r0
	.align 2, 0
_08085FF8: .4byte 0x03005240
_08085FFC: .4byte 0x08A5A6A0

