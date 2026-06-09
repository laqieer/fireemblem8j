	.syntax unified
	.set ClearWmHblank, 0x080C6B2C + 1
	.set Proc_End, 0x08002CBC + 1
	.set ResetUnitSprites, 0x0802662C + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set SetSecondaryHBlankHandler, 0x08001D3C + 1
	.set sub_8006980, 0x08006980 + 1
	.set sub_800814C, 0x0800814C + 1
	.set sub_80C3F48, 0x080C3F48 + 1
	.set sub_80C8C4C, 0x080C8C4C + 1
	.section .text.sub_80BD8E0, "ax", %progbits
@ sub_80BD8E0 @ JP 0x080BD8E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD8E0
	.thumb_func
sub_80BD8E0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	bl Proc_End
	ldr r0, [r4, #0x44]
	bl Proc_End
	ldr r0, [r4, #0x48]
	bl Proc_End
	movs r0, #0
	bl SetSecondaryHBlankHandler
	bl ClearWmHblank
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl sub_8006980
	bl sub_800814C
	bl ResetUnitSprites
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	bl sub_80C3F48
	bl sub_80C8C4C
	ldr r2, _080BD940 @ =0x03005270
	ldrb r1, [r2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	subs r1, #0x81
	ands r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD940: .4byte 0x03005270

