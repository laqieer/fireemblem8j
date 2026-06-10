	.syntax unified
	.set sub_800226C, 0x0800226C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8047550, "ax", %progbits
@ sub_8047550 @ JP 0x08047550 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8047550
	.thumb_func
sub_8047550:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08047574 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804756E
	movs r0, #0
	bl sub_800226C
	adds r0, r4, #0
	bl sub_8002DE4
_0804756E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047574: .4byte 0x085775CC

