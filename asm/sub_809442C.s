	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_809442C, "ax", %progbits
@ sub_809442C @ JP 0x0809442C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809442C
	.thumb_func
sub_809442C:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _08094444
	ldr r0, _08094440 @ =0x08A936DC
	movs r1, #3
	bl sub_8002BCC
	b _0809444A
	.align 2, 0
_08094440: .4byte 0x08A936DC
_08094444:
	ldr r0, _08094458 @ =0x08A936DC
	bl Proc_StartBlocking
_0809444A:
	adds r1, r0, #0
	adds r1, #0x39
	movs r0, #3
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08094458: .4byte 0x08A936DC

