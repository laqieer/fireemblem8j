	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_809445C, "ax", %progbits
@ sub_809445C @ JP 0x0809445C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809445C
	.thumb_func
sub_809445C:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _08094474
	ldr r0, _08094470 @ =0x08A9360C
	movs r1, #3
	bl sub_8002BCC
	b _0809447A
	.align 2, 0
_08094470: .4byte 0x08A9360C
_08094474:
	ldr r0, _08094488 @ =0x08A9360C
	bl Proc_StartBlocking
_0809447A:
	adds r1, r0, #0
	adds r1, #0x39
	movs r0, #4
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08094488: .4byte 0x08A9360C

