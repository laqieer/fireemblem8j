	.syntax unified
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.section .text.sub_802E938, "ax", %progbits
@ sub_802E938 @ JP 0x0802E938 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802E938
	.thumb_func
sub_802E938:
	push {r4, r5, lr}
	ldr r4, _0802E950 @ =0x0202BCEC
	ldrb r5, [r4, #0xf]
	movs r0, #0x80
	strb r0, [r4, #0xf]
	bl RefreshEntityBmMaps
	strb r5, [r4, #0xf]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E950: .4byte 0x0202BCEC

