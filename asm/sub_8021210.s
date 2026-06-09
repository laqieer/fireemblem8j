	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8021210, "ax", %progbits
@ sub_8021210 @ JP 0x08021210 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8021210
	.thumb_func
sub_8021210:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08021224
	ldr r0, _08021220 @ =0x085C37D8
	bl Proc_StartBlocking
	b _0802122C
	.align 2, 0
_08021220: .4byte 0x085C37D8
_08021224:
	ldr r0, _08021230 @ =0x085C37D8
	movs r1, #3
	bl sub_8002BCC
_0802122C:
	pop {r0}
	bx r0
	.align 2, 0
_08021230: .4byte 0x085C37D8

