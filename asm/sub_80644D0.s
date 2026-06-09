	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_80644D0, "ax", %progbits
@ sub_80644D0 @ JP 0x080644D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80644D0
	.thumb_func
sub_80644D0:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08064514 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064518 @ =0x0860114C
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0806451C @ =0x086BF0FC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	ldr r0, _08064520 @ =0x086BB044
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08064524 @ =0x086B3B5C
	movs r1, #0x80
	lsls r1, r1, #4
	bl sub_8056774
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064514: .4byte 0x0201774C
_08064518: .4byte 0x0860114C
_0806451C: .4byte 0x086BF0FC
_08064520: .4byte 0x086BB044
_08064524: .4byte 0x086B3B5C

