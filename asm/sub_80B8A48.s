	.syntax unified
	.set EndActiveClassReelBgColorProc, 0x08070ED4 + 1
	.set EndActiveClassReelSpell, 0x08070EB8 + 1
	.set Proc_End, 0x08002CBC + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8006980, 0x08006980 + 1
	.set sub_805B7CC, 0x0805B7CC + 1
	.set sub_805BBB8, 0x0805BBB8 + 1
	.set sub_80B75D0, 0x080B75D0 + 1
	.section .text.sub_80B8A48, "ax", %progbits
@ sub_80B8A48 @ JP 0x080B8A48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8A48
	.thumb_func
sub_80B8A48:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl sub_8006980
	bl EndActiveClassReelBgColorProc
	ldr r0, _080B8A80 @ =0x0201DB00
	bl sub_805BBB8
	bl EndActiveClassReelSpell
	ldr r0, _080B8A84 @ =0x02000000
	bl sub_805B7CC
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B8A74
	bl Proc_End
_080B8A74:
	movs r0, #2
	bl sub_80B75D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8A80: .4byte 0x0201DB00
_080B8A84: .4byte 0x02000000

