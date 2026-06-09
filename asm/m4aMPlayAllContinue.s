	.syntax unified
	.set MPlayContinue, 0x080D4E34 + 1
	.section .text.m4aMPlayAllContinue, "ax", %progbits
@ m4aMPlayAllContinue @ JP 0x080D5060 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global m4aMPlayAllContinue
	.thumb_func
m4aMPlayAllContinue:
	push {r4, r5, lr}
	ldr r0, _080D5084 @ =0x00000009
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080D507E
	ldr r5, _080D5088 @ =0x082140B4
	adds r4, r0, #0
_080D5070:
	ldr r0, [r5]
	bl MPlayContinue
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _080D5070
_080D507E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D5084: .4byte 0x00000009
_080D5088: .4byte 0x082140B4

