	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_8002EB4, 0x08002EB4 + 1
	.set sub_8010F98, 0x08010F98 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CC9C, 0x0802CC9C + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_80A8F0C, 0x080A8F0C + 1
	.section .text.sub_80BA638, "ax", %progbits
@ sub_80BA638 @ JP 0x080BA638 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA638
	.thumb_func
sub_80BA638:
	push {r4, r5, r6, lr}
	movs r1, #7
	bl sub_8002EB4
	bl sub_8010F98
	ldr r0, _080BA678 @ =0x08ABCAB8
	bl Proc_EndEach
	ldr r5, _080BA67C @ =0x0203A954
	movs r6, #0
	movs r0, #0x19
	strb r0, [r5, #0x11]
	ldr r4, _080BA680 @ =0x03004DF0
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	movs r2, #0x40
	orrs r1, r2
	str r1, [r0, #0xc]
	bl sub_80A8F0C
	bl sub_807B4B8
	strb r6, [r5, #0x15]
	ldr r0, [r4]
	bl sub_802CC9C
	bl sub_802C94C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA678: .4byte 0x08ABCAB8
_080BA67C: .4byte 0x0203A954
_080BA680: .4byte 0x03004DF0

