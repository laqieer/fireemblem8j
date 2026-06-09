	.syntax unified
	.set sub_8015E18, 0x08015E18 + 1
	.section .text.sub_808392C, "ax", %progbits
@ sub_808392C @ JP 0x0808392C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808392C
	.thumb_func
sub_808392C:
	push {r4, lr}
	ldr r2, _08083954 @ =0x0203E1EC
	ldr r1, _08083958 @ =0x0203A568
	adds r3, r1, #0
	adds r3, #0x73
	ldrb r3, [r3]
	adds r4, r2, #0
	adds r4, #0x60
	strb r3, [r4]
	adds r1, #0x74
	ldrb r1, [r1]
	adds r2, #0x61
	strb r1, [r2]
	ldrb r1, [r4]
	ldrb r2, [r2]
	bl sub_8015E18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083954: .4byte 0x0203E1EC
_08083958: .4byte 0x0203A568

