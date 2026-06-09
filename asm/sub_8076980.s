	.syntax unified
	.set EnableEfxHpBarColorChange, 0x080553BC + 1
	.set EnableEfxStatusUnits, 0x0805585C + 1
	.set EnableEfxWeaponIcon, 0x08055BD0 + 1
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_8076980, "ax", %progbits
@ sub_8076980 @ JP 0x08076980 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076980
	.thumb_func
sub_8076980:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080769B4 @ =0x020200D8
	ldr r0, [r0]
	bl Proc_End
	ldr r0, _080769B8 @ =0x020200DC
	ldr r0, [r0]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl EnableEfxStatusUnits
	ldr r0, [r4, #0x60]
	bl EnableEfxStatusUnits
	bl EnableEfxWeaponIcon
	bl EnableEfxHpBarColorChange
	adds r4, #0x29
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080769B4: .4byte 0x020200D8
_080769B8: .4byte 0x020200DC

