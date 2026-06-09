	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_800D45C, 0x0800D45C + 1
	.section .text.sub_8022DB8, "ax", %progbits
@ sub_8022DB8 @ JP 0x08022DB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022DB8
	.thumb_func
sub_8022DB8:
	push {r4, lr}
	adds r4, r1, #0
	bl sub_800D45C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08022DCC
	movs r0, #0
	b _08022DF2
_08022DCC:
	ldr r1, _08022DF8 @ =0x0203A954
	movs r0, #2
	strb r0, [r1, #0x11]
	ldrb r0, [r4, #2]
	strb r0, [r1, #0xd]
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08022DEA
	ldrb r0, [r4]
	strb r0, [r1, #0x13]
	ldrb r0, [r4, #1]
	strb r0, [r1, #0x14]
	ldrb r0, [r4, #3]
	strb r0, [r1, #0x15]
_08022DEA:
	ldr r0, _08022DFC @ =0x085C6A48
	bl Proc_EndEach
	movs r0, #0x17
_08022DF2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022DF8: .4byte 0x0203A954
_08022DFC: .4byte 0x085C6A48

