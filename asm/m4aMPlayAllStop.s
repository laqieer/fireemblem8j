	.syntax unified
	.set m4aMPlayStop, 0x080D570C + 1
	.section .text.m4aMPlayAllStop, "ax", %progbits
@ m4aMPlayAllStop @ JP 0x080D5028 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global m4aMPlayAllStop
	.thumb_func
m4aMPlayAllStop:
	push {r4, r5, lr}
	ldr r0, _080D504C @ =0x00000009
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080D5046
	ldr r5, _080D5050 @ =0x082140B4
	adds r4, r0, #0
_080D5038:
	ldr r0, [r5]
	bl m4aMPlayStop
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _080D5038
_080D5046:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D504C: .4byte 0x00000009
_080D5050: .4byte 0x082140B4

