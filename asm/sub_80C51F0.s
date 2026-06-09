	.syntax unified
	.set ClearWorldMapHblankChannelFlags, 0x080C6BA4 + 1
	.set GetWorldMapHblankBuffer, 0x080C6B5C + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SetWorldMapHblankDest, 0x080C6B94 + 1
	.set sub_80B2D4C, 0x080B2D4C + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80C51F0, "ax", %progbits
@ sub_80C51F0 @ JP 0x080C51F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C51F0
	.thumb_func
sub_80C51F0:
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #2
	bne _080C520A
	movs r0, #1
	movs r1, #0
	bl sub_80B2D4C
	movs r0, #0x64
	b _080C5214
_080C520A:
	movs r0, #2
	movs r1, #0
	bl sub_80B2D4C
	movs r0, #0x32
_080C5214:
	strh r0, [r4, #0x2c]
	movs r5, #0
	strh r5, [r4, #0x2a]
	add r1, sp, #4
	movs r0, #0x10
	strh r0, [r1]
	movs r0, #0
	movs r1, #0
	bl GetWorldMapHblankBuffer
	adds r1, r0, #0
	add r0, sp, #4
	ldr r2, _080C52A0 @ =0x010000A0
	bl sub_80D6370
	ldr r1, _080C52A4 @ =0x04000054
	movs r0, #0
	bl SetWorldMapHblankDest
	movs r0, #0
	bl ClearWorldMapHblankChannelFlags
	movs r0, #3
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0x10
	bl SetBlendConfig
	ldr r2, _080C52A8 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r4, #4
	orrs r0, r4
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	ldr r1, _080C52AC @ =0x0201BE30
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C52A0: .4byte 0x010000A0
_080C52A4: .4byte 0x04000054
_080C52A8: .4byte 0x03003020
_080C52AC: .4byte 0x0201BE30

