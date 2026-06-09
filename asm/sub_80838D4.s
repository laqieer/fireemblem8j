	.syntax unified
	.set sub_8015E18, 0x08015E18 + 1
	.section .text.sub_80838D4, "ax", %progbits
@ sub_80838D4 @ JP 0x080838D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80838D4
	.thumb_func
sub_80838D4:
	push {lr}
	ldr r3, _080838FC @ =0x0203E1EC
	adds r1, r3, #0
	adds r1, #0x58
	ldrb r2, [r1]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_8015E18
	pop {r0}
	bx r0
	.align 2, 0
_080838FC: .4byte 0x0203E1EC

