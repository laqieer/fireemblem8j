	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8090A1C, "ax", %progbits
@ sub_8090A1C @ JP 0x08090A1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8090A1C
	.thumb_func
sub_8090A1C:
	push {lr}
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _08090A2E
	ldr r0, _08090A34 @ =0x085C3298
	bl Proc_StartBlocking
_08090A2E:
	pop {r0}
	bx r0
	.align 2, 0
_08090A34: .4byte 0x085C3298

