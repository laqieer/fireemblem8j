	.syntax unified
	.set NewTargetSelection_Specialized, 0x08050818 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8035610, 0x08035610 + 1
	.section .text.sub_8029CF8, "ax", %progbits
@ sub_8029CF8 @ JP 0x08029CF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029CF8
	.thumb_func
sub_8029CF8:
	push {r4, lr}
	ldr r0, _08029D18 @ =0x085C57D8
	ldr r1, _08029D1C @ =StaffSelectOnSelect
	bl NewTargetSelection_Specialized
	adds r4, r0, #0
	ldr r0, _08029D20 @ =0x000007F4
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8035610
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029D18: .4byte 0x085C57D8
_08029D1C: .4byte 0x080294F9  @ StaffSelectOnSelect
_08029D20: .4byte 0x000007F4

