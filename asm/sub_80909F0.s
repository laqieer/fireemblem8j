	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_808B7E0, 0x0808B7E0 + 1
	.section .text.sub_80909F0, "ax", %progbits
@ sub_80909F0 @ JP 0x080909F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80909F0
	.thumb_func
sub_80909F0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08090A18 @ =0x08A73D5C
	bl Proc_EndEach
	bl sub_808B7E0
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _08090A12
	ldr r0, [r4, #0x34]
	ldr r1, [r0, #0xc]
	movs r2, #2
	orrs r1, r2
	str r1, [r0, #0xc]
_08090A12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090A18: .4byte 0x08A73D5C

