	.syntax unified
	.set sub_800226C, 0x0800226C + 1
	.set sub_80024C4, 0x080024C4 + 1
	.section .text.sub_800E004, "ax", %progbits
@ sub_800E004 @ JP 0x0800E004 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800E004
	.thumb_func
sub_800E004:
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x38]
	ldrb r0, [r1]
	movs r4, #0xf
	ands r4, r0
	movs r0, #2
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bge _0800E01E
	ldr r0, _0800E034 @ =0x030004B0
	movs r1, #8
	ldrsh r2, [r0, r1]
_0800E01E:
	ldr r0, _0800E038 @ =0x00007FFF
	cmp r2, r0
	beq _0800E048
	ldrh r0, [r3, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E03C
	movs r0, #0
	b _0800E05E
	.align 2, 0
_0800E034: .4byte 0x030004B0
_0800E038: .4byte 0x00007FFF
_0800E03C:
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_80024C4
	b _0800E05C
_0800E048:
	ldrh r0, [r3, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E056
	movs r4, #1
_0800E056:
	adds r0, r4, #0
	bl sub_800226C
_0800E05C:
	movs r0, #2
_0800E05E:
	pop {r4}
	pop {r1}
	bx r1

