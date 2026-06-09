	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80C8B64, "ax", %progbits
@ sub_80C8B64 @ JP 0x080C8B64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8B64
	.thumb_func
sub_80C8B64:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _080C8C20 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r2, #0x36
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0xe
	movs r2, #3
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
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
	movs r0, #0
	bl SetBlendBackdropA
	ldr r0, _080C8C24 @ =0x08B26A6C
	ldr r1, _080C8C28 @ =0x06003C00
	bl sub_8013008
	ldr r0, _080C8C2C @ =0x08B2715C
	movs r1, #0xe0
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080C8C30 @ =0x08B1CCF4
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	bl sub_8001EE4
	ldr r0, _080C8C34 @ =0x08AC2838
	ldr r1, [r4, #0x14]
	bl sub_8002BCC
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8C20: .4byte 0x03003020
_080C8C24: .4byte 0x08B26A6C
_080C8C28: .4byte 0x06003C00
_080C8C2C: .4byte 0x08B2715C
_080C8C30: .4byte 0x08B1CCF4
_080C8C34: .4byte 0x08AC2838

