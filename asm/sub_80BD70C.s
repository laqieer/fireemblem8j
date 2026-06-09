	.syntax unified
	.set GetWMFaceBg, 0x080BD158 + 1
	.set GetWMFaceVramOffset, 0x080BD174 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_8006600, 0x08006600 + 1
	.set sub_8006620, 0x08006620 + 1
	.section .text.sub_80BD70C, "ax", %progbits
@ sub_80BD70C @ JP 0x080BD70C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD70C
	.thumb_func
sub_80BD70C:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r0, _080BD75C @ =0x08AC10C0
	bl Proc_Find
	adds r6, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r1, [r6, #0x2c]
	adds r4, r1, r0
	ldr r0, _080BD760 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080BD764
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	b _080BD782
	.align 2, 0
_080BD75C: .4byte 0x08AC10C0
_080BD760: .4byte 0x03005270
_080BD764:
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
_080BD782:
	bl GetWMFaceBg
	adds r5, r0, #0
	bl GetWMFaceVramOffset
	adds r2, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _080BD816
	ldrh r1, [r4, #2]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	bne _080BD816
	lsrs r0, r2, #5
	movs r2, #8
	ldrsh r1, [r4, r2]
	bl sub_8006600
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r0, #4
	bl sub_8006620
	adds r0, r5, #0
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	ldrh r0, [r4, #2]
	ldr r1, _080BD7D8 @ =0xFFFFFF00
	ands r1, r0
	movs r2, #0xc0
	lsls r2, r2, #2
	ands r2, r7
	cmp r2, #0
	beq _080BD7E0
	ldr r0, _080BD7DC @ =0x0000FCFF
	ands r1, r0
	orrs r1, r2
	b _080BD7E4
	.align 2, 0
_080BD7D8: .4byte 0xFFFFFF00
_080BD7DC: .4byte 0x0000FCFF
_080BD7E0:
	ldr r0, _080BD820 @ =0x0000FCFF
	ands r1, r0
_080BD7E4:
	movs r0, #0xff
	lsls r0, r0, #8
	ands r1, r0
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r1, r2
	strh r0, [r4, #2]
	movs r0, #0xff
	strb r0, [r4, #0xa]
	adds r1, r6, #0
	adds r1, #0x30
	movs r0, #0xfe
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080BD816
	movs r0, #0x20
	strb r0, [r1]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
_080BD816:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD820: .4byte 0x0000FCFF

