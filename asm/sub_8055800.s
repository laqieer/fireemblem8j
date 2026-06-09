	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_8055800, "ax", %progbits
@ sub_8055800 @ JP 0x08055800 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055800
	.thumb_func
sub_8055800:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08055838 @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _08055832
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl Proc_End
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0
	str r1, [r0]
_08055832:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055838: .4byte 0x0201776C

