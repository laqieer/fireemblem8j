	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_800139C, 0x0800139C + 1
	.set sub_8050C58, 0x08050C58 + 1
	.set sub_8051EA0, 0x08051EA0 + 1
	.set sub_8056BC0, 0x08056BC0 + 1
	.set sub_80D63D8, 0x080D63D8 + 1
	.section .text.sub_8050BB4, "ax", %progbits
@ sub_8050BB4 @ JP 0x08050BB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050BB4
	.thumb_func
sub_8050BB4:
	push {lr}
	ldr r0, _08050BCC @ =0x085775CC
	ldr r0, [r0]
	bl sub_800139C
	ldr r0, _08050BD0 @ =0x0200001C
	ldr r0, [r0]
	cmp r0, #0
	bne _08050BD4
	bl sub_8050C58
	b _08050BE0
	.align 2, 0
_08050BCC: .4byte 0x085775CC
_08050BD0: .4byte 0x0200001C
_08050BD4:
	ldr r0, _08050BF4 @ =0x02000020
	ldr r0, [r0]
	cmp r0, #1
	bne _08050BE0
	bl sub_8050C58
_08050BE0:
	ldr r0, _08050BF8 @ =0x02017724
	ldr r0, [r0]
	cmp r0, #1
	beq _08050BFC
	cmp r0, #1
	blo _08050C38
	cmp r0, #2
	beq _08050C0C
	b _08050C38
	.align 2, 0
_08050BF4: .4byte 0x02000020
_08050BF8: .4byte 0x02017724
_08050BFC:
	ldr r0, _08050C08 @ =0x0203E0F8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050C38
	b _08050C16
	.align 2, 0
_08050C08: .4byte 0x0203E0F8
_08050C0C:
	ldr r0, _08050C24 @ =0x0203E0F8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050C2C
_08050C16:
	ldr r0, _08050C28 @ =0x02000064
	ldr r0, [r0]
	bl Proc_End
	bl sub_8056BC0
	b _08050C38
	.align 2, 0
_08050C24: .4byte 0x0203E0F8
_08050C28: .4byte 0x02000064
_08050C2C:
	ldr r0, _08050C4C @ =0x02000064
	ldr r0, [r0]
	bl Proc_End
	bl sub_8051EA0
_08050C38:
	ldr r1, _08050C50 @ =0x0202BCAC
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08050C54 @ =0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl sub_80D63D8
	pop {r0}
	bx r0
	.align 2, 0
_08050C4C: .4byte 0x02000064
_08050C50: .4byte 0x0202BCAC
_08050C54: .4byte 0x04000006

