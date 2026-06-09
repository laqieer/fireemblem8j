	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_807BD84, "ax", %progbits
@ sub_807BD84 @ JP 0x0807BD84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BD84
	.thumb_func
sub_807BD84:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807BDAC @ =0x08A12FA8
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _0807BDB0 @ =0x08A13398
	adds r1, r4, #0
	bl sub_8002BCC
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BDAC: .4byte 0x08A12FA8
_0807BDB0: .4byte 0x08A13398

