	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8055E2C, "ax", %progbits
@ sub_8055E2C @ JP 0x08055E2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055E2C
	.thumb_func
sub_8055E2C:
	push {r4, r5, lr}
	ldr r0, _08055E5C @ =0x085E3C94
	movs r1, #4
	bl sub_8002BCC
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r4, #0x2c]
	movs r0, #4
	strh r0, [r4, #0x2e]
	ldr r5, _08055E60 @ =0x02017778
	ldr r0, [r5]
	cmp r0, #0
	beq _08055E52
	bl Proc_End
_08055E52:
	str r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055E5C: .4byte 0x085E3C94
_08055E60: .4byte 0x02017778

