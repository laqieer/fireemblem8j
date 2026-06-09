	.syntax unified
	.set AnimClearAll, 0x08004DC0 + 1
	.set EkrEfxStatusClear, 0x08052F18 + 1
	.set SetMainUpdateRoutine, 0x080012D8 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8074B88, 0x08074B88 + 1
	.section .text.sub_8050B48, "ax", %progbits
@ sub_8050B48 @ JP 0x08050B48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050B48
	.thumb_func
sub_8050B48:
	push {r4, lr}
	bl AnimClearAll
	ldr r4, _08050B90 @ =0x02000064
	ldr r0, _08050B94 @ =0x085E3558
	movs r1, #3
	bl sub_8002BCC
	str r0, [r4]
	ldr r0, _08050B98 @ =sub_8050BB4
	bl SetMainUpdateRoutine
	bl EkrEfxStatusClear
	ldr r0, _08050B9C @ =0x02017724
	movs r1, #0
	str r1, [r0]
	ldr r0, _08050BA0 @ =0x02000018
	str r1, [r0]
	ldr r0, _08050BA4 @ =0x0200001C
	str r1, [r0]
	ldr r0, _08050BA8 @ =0x02000020
	str r1, [r0]
	ldr r0, _08050BAC @ =0x02000024
	str r1, [r0]
	ldr r0, _08050BB0 @ =0x0203E0F8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050B88
	bl sub_8074B88
_08050B88:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050B90: .4byte 0x02000064
_08050B94: .4byte 0x085E3558
_08050B98: .4byte 0x08050BB5  @ sub_8050BB4
_08050B9C: .4byte 0x02017724
_08050BA0: .4byte 0x02000018
_08050BA4: .4byte 0x0200001C
_08050BA8: .4byte 0x02000020
_08050BAC: .4byte 0x02000024
_08050BB0: .4byte 0x0203E0F8

