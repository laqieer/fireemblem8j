	.syntax unified
	.set EndMenuScrollBar, 0x08099968 + 1
	.set sub_808B7E0, 0x0808B7E0 + 1
	.set sub_8097D18, 0x08097D18 + 1
	.set sub_80B187C, 0x080B187C + 1
	.set sub_80B1D74, 0x080B1D74 + 1
	.set sub_80B1DBC, 0x080B1DBC + 1
	.set sub_80B2020, 0x080B2020 + 1
	.section .text.sub_809D2DC, "ax", %progbits
@ sub_809D2DC @ JP 0x0809D2DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809D2DC
	.thumb_func
sub_809D2DC:
	push {lr}
	bl EndMenuScrollBar
	bl sub_80B1DBC
	bl sub_80B1D74
	bl sub_80B2020
	bl sub_808B7E0
	bl sub_80B187C
	bl sub_8097D18
	pop {r0}
	bx r0
	.align 2, 0

