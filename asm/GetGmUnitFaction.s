	.syntax unified
	.section .text.GetGmUnitFaction, "ax", %progbits
@ GetGmUnitFaction @ JP 0x080C2018 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetGmUnitFaction
	.thumb_func
GetGmUnitFaction:
	push {lr}
	adds r1, r0, #0
	cmp r1, #6
	ble _080C2022
	movs r1, #0
_080C2022:
	ldr r0, _080C202C @ =0x081F6534
	adds r0, r1, r0
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080C202C: .4byte 0x081F6534

