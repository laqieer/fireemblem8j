	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80BF02C, "ax", %progbits
@ sub_80BF02C @ JP 0x080BF02C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BF02C
	.thumb_func
sub_80BF02C:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080BF078 @ =0x08AC1108
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080BF07C @ =0x08AC16E0
	bl sub_8002BCC
	adds r5, r0, #0
	movs r0, #0x1f
	ands r4, r0
	str r4, [r5, #0x30]
	movs r0, #0
	str r0, [r5, #0x2c]
	ldr r0, _080BF080 @ =0x085C7340
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl sub_8000D68
	ldr r0, _080BF084 @ =0x020228A8
	lsls r4, r4, #5
	adds r4, r4, r0
	adds r4, #2
	adds r5, #0x34
	movs r1, #0xe
_080BF062:
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	adds r5, #2
	subs r1, #1
	cmp r1, #0
	bge _080BF062
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BF078: .4byte 0x08AC1108
_080BF07C: .4byte 0x08AC16E0
_080BF080: .4byte 0x085C7340
_080BF084: .4byte 0x020228A8

