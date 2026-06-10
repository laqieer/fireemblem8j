	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_80181B0, 0x080181B0 + 1
	.set sub_8018370, 0x08018370 + 1
	.set sub_80183E8, 0x080183E8 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_801CC70, "ax", %progbits
@ sub_801CC70 @ JP 0x0801CC70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801CC70
	.thumb_func
sub_801CC70:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0801CCB8 @ =0x03004DF0
	ldr r1, [r4]
	ldr r2, _0801CCBC @ =0x0202BE44
	ldrh r0, [r2]
	strb r0, [r1, #0x10]
	ldr r1, [r4]
	ldrh r0, [r2, #2]
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	bl sub_80181B0
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	bl RefreshEntityBmMaps
	bl sub_8019914
	bl sub_8027144
	ldr r4, [r4]
	ldr r0, [r4, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801CCC0
	adds r0, r4, #0
	bl sub_8018370
	b _0801CCC6
	.align 2, 0
_0801CCB8: .4byte 0x03004DF0
_0801CCBC: .4byte 0x0202BE44
_0801CCC0:
	adds r0, r4, #0
	bl sub_80183E8
_0801CCC6:
	ldr r4, _0801CCE8 @ =0x03004DF0
	ldr r0, [r4]
	bl sub_80280A0
	bl sub_807B4B8
	ldr r0, [r4]
	bl sub_807A888
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801CCE8: .4byte 0x03004DF0

