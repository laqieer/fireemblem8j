	.syntax unified
	.section .text.sub_8055E64, "ax", %progbits
@ sub_8055E64 @ JP 0x08055E64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055E64
	.thumb_func
sub_8055E64:
	push {lr}
	ldr r0, _08055E7C @ =0x02017778
	ldr r0, [r0]
	cmp r0, #0
	beq _08055E76
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_08055E76:
	pop {r0}
	bx r0
	.align 2, 0
_08055E7C: .4byte 0x02017778

