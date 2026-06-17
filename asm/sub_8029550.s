	.syntax unified
	.set NewTargetSelection_Specialized, 0x08050818 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8035610, 0x08035610 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_8029550, "ax", %progbits
@ sub_8029550 @ JP 0x08029550 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029550
	.thumb_func
sub_8029550:
	push {r4, r5, lr}
	adds r5, r2, #0
	bl sub_80D65C0
	ldr r0, _08029584 @ =0x0202E4DC
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	ldr r0, _08029588 @ =0x085C57D8
	ldr r1, _0802958C @ =StaffSelectOnSelect
	bl NewTargetSelection_Specialized
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8035610
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029584: .4byte 0x0202E4DC
_08029588: .4byte 0x085C57D8
_0802958C: .4byte 0x080294F9  @ StaffSelectOnSelect

