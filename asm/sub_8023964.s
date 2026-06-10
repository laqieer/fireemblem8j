	.syntax unified
	.set sub_80256D8, 0x080256D8 + 1
	.set sub_804F610, 0x0804F610 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.section .text.sub_8023964, "ax", %progbits
@ sub_8023964 @ JP 0x08023964 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023964
	.thumb_func
sub_8023964:
	push {lr}
	bl sub_804F610
	ldr r1, _08023984 @ =0x0203A954
	movs r0, #8
	strb r0, [r1, #0x12]
	ldr r0, _08023988 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_80256D8
	ldr r0, _0802398C @ =0x085C58D8
	bl sub_80507B0
	movs r0, #0x26
	pop {r1}
	bx r1
	.align 2, 0
_08023984: .4byte 0x0203A954
_08023988: .4byte 0x03004DF0
_0802398C: .4byte 0x085C58D8

