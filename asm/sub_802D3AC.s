	.syntax unified
	.set InitTextDb, 0x08003CB4 + 1
	.section .text.sub_802D3AC, "ax", %progbits
@ sub_802D3AC @ JP 0x0802D3AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802D3AC
	.thumb_func
sub_802D3AC:
	push {r4, r5, r6, r7, lr}
	movs r1, #0
	ldr r7, _0802D3DC @ =0x0200278C
_0802D3B2:
	movs r5, #0
	lsls r0, r1, #2
	adds r6, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r4, r7, r0
_0802D3BE:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	adds r5, #1
	cmp r5, #4
	ble _0802D3BE
	adds r1, r6, #0
	cmp r1, #1
	ble _0802D3B2
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D3DC: .4byte 0x0200278C

