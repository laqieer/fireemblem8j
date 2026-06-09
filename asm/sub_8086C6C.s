	.syntax unified
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_8086C6C, "ax", %progbits
@ sub_8086C6C @ JP 0x08086C6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086C6C
	.thumb_func
sub_8086C6C:
	push {r4, lr}
	movs r4, #0
	ldr r1, _08086CA0 @ =0x08A5F7D0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _08086C84
	adds r1, #0xc
_08086C7A:
	adds r1, #0x18
	adds r4, #1
	ldr r0, [r1]
	cmp r0, #0
	bne _08086C7A
_08086C84:
	bl sub_8000CD8
	movs r1, #0xf
	ands r1, r0
	adds r0, r1, #0
	adds r1, r4, #0
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086CA0: .4byte 0x08A5F7D0

