	.syntax unified
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_8086CA4, "ax", %progbits
@ sub_8086CA4 @ JP 0x08086CA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086CA4
	.thumb_func
sub_8086CA4:
	push {r4, lr}
	movs r4, #0
	ldr r1, _08086CD8 @ =0x08A5F7D0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _08086CBC
	adds r1, #0xc
_08086CB2:
	adds r1, #0x18
	adds r4, #1
	ldr r0, [r1]
	cmp r0, #0
	bne _08086CB2
_08086CBC:
	bl sub_8000CD8
	lsrs r0, r0, #1
	movs r1, #0xf
	ands r0, r1
	adds r1, r4, #0
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086CD8: .4byte 0x08A5F7D0

