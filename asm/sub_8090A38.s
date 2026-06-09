	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8090A38, "ax", %progbits
@ sub_8090A38 @ JP 0x08090A38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8090A38
	.thumb_func
sub_8090A38:
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _08090A58
	ldr r0, _08090A54 @ =0x08A73C0C
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x3f
	movs r0, #0
	strb r0, [r1]
	b _08090A64
	.align 2, 0
_08090A54: .4byte 0x08A73C0C
_08090A58:
	ldr r0, _08090A6C @ =0x08A73C0C
	movs r1, #3
	bl sub_8002BCC
	adds r0, #0x3f
	strb r4, [r0]
_08090A64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090A6C: .4byte 0x08A73C0C

