	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B2708, "ax", %progbits
@ SetSysBrownBoxWidth @ JP 0x080B2708 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetSysBrownBoxWidth
	.thumb_func
SetSysBrownBoxWidth:
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	asrs r5, r1, #0x18
	ldr r0, _080B272C @ =0x08A9DCD4
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080B2724
	lsls r0, r4, #3
	adds r0, r1, r0
	adds r0, #0x32
	strb r5, [r0]
_080B2724:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B272C: .4byte 0x08A9DCD4

