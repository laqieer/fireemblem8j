	.syntax unified
	.section .text.sub_8055E80, "ax", %progbits
@ sub_8055E80 @ JP 0x08055E80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055E80
	.thumb_func
sub_8055E80:
	push {lr}
	ldr r0, _08055E98 @ =0x02017778
	ldr r0, [r0]
	cmp r0, #0
	beq _08055E92
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
_08055E92:
	pop {r0}
	bx r0
	.align 2, 0
_08055E98: .4byte 0x02017778

