	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_8045008, "ax", %progbits
@ sub_8045008 @ JP 0x08045008 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8045008
	.thumb_func
sub_8045008:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08045048 @ =0x03001808
	adds r5, r6, #0
	adds r5, #0x3a
	ldrb r3, [r5]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xf
	bl sub_8012E84
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _08045040
	movs r0, #0
	bl SetPrimaryHBlankHandler
	adds r0, r6, #0
	bl sub_8002DE4
_08045040:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08045048: .4byte 0x03001808

