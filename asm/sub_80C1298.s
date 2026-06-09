	.syntax unified
	.set StartMenuAt, 0x0804FA24 + 1
	.set sub_8003BE8, 0x08003BE8 + 1
	.section .text.sub_80C1298, "ax", %progbits
@ sub_80C1298 @ JP 0x080C1298 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C1298
	.thumb_func
sub_80C1298:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080C12C0 @ =0x03005270
	movs r0, #0
	strb r0, [r1, #1]
	ldr r0, _080C12C4 @ =0x0201AFC0
	ldr r1, _080C12C8 @ =0x06001000
	movs r2, #0x80
	movs r3, #0
	bl sub_8003BE8
	ldr r0, _080C12CC @ =0x08AC1AE4
	ldr r1, _080C12D0 @ =0x08AC1B08
	ldr r1, [r1]
	adds r2, r4, #0
	bl StartMenuAt
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C12C0: .4byte 0x03005270
_080C12C4: .4byte 0x0201AFC0
_080C12C8: .4byte 0x06001000
_080C12CC: .4byte 0x08AC1AE4
_080C12D0: .4byte 0x08AC1B08

