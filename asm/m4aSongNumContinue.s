	.syntax unified
	.set MPlayContinue, 0x080D4E34 + 1
	.section .text.m4aSongNumContinue, "ax", %progbits
@ m4aSongNumContinue @ JP 0x080D4FF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global m4aSongNumContinue
	.thumb_func
m4aSongNumContinue:
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080D5020 @ =0x082140B4
	ldr r1, _080D5024 @ =0x08214120
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _080D501A
	adds r0, r2, #0
	bl MPlayContinue
_080D501A:
	pop {r0}
	bx r0
	.align 2, 0
_080D5020: .4byte 0x082140B4
_080D5024: .4byte 0x08214120

